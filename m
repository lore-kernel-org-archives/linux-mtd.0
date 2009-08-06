Received: from exhub015-2.exch015.msoutlookonline.net ([207.5.72.94])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MYqyw-0003Og-L1
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 00:37:26 +0000
Message-ID: <4A7A25BE.4000302@orb.com>
Date: Wed, 5 Aug 2009 17:37:18 -0700
From: Jehan Bing <jehan@orb.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/5 v3] [MTD-UTILS] Unified reading from standard input and
	from file
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem and al,

Here is a (late) follow up on my previous patches (last email 
http://article.gmane.org/gmane.linux.drivers.mtd/25995)
For reminder, those patches were to improve the support of the standard 
input in nandwrite, in particular, to handle badblocks.

I'm going to describe the test I did and provide the files I used.

First is a patch to nanddump.
I added a "-m" setting (to match the "-m" in nandwrite) that will skip 
badblock instead of omitting them (-b). With "-b", the dump may be 
shorter than the specified length (-l) if there are any bad blocks. With 
"-m", nanddump will read more data until the length is reached.
I'm not sending the patch to commit in the official tree because it's 
incomplete (missing the usage string and the long parameter and it would 
probably be a good idea to prevent having both -m and -o set at the same 
time too) but if you want to do it anyway, feel free :)


Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nanddump.c	2009-08-04 16:54:03.000000000 -0700
+++ b/nanddump.c	2009-08-04 17:49:20.000000000 -0700
@@ -83,6 +83,7 @@ static const char	*mtddev;		// mtd devic
 static const char	*dumpfile;		// dump file name
 static bool		omitbad = false;
 static bool		quiet = false;		// suppress diagnostic output
+static bool     skipbad = false;
 
 static void process_options (int argc, char * const argv[])
 {
@@ -90,7 +91,7 @@ static void process_options (int argc, c
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:il:opqn";
+		static const char *short_options = "bs:f:il:opqnm";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -153,6 +154,9 @@ static void process_options (int argc, c
 			case 'n':
 				noecc = true;
 				break;
+			case 'm':
+				skipbad = true;
+				break;
 			case '?':
 				error++;
 				break;
@@ -298,6 +302,12 @@ int main(int argc, char * const argv[])
 				perror("ioctl(MEMGETBADBLOCK)");
 				goto closeall;
 			}
+			if (badblock && skipbad) {
+				fprintf(stderr, "skipping bad block\n");
+				end_addr += meminfo.erasesize;
+				ofs += meminfo.erasesize - bs;
+				continue;
+			}
 		}
 
 		if (badblock) {



Next is the script I used to test. It requires a "nandwrite.orig" which 
is the binary as it was after commit 
59c537d0fd1af368eaeed5ec27e2336077c18691 and before commit 
bc0cd0d9606c7d0c41d09a694b49bade159815b1.
It also requires a "nandwrite.new" which is nandwrite from the head 
after applying the 5 patches.

Each test runs once with the original nandwrite and once with the new one.
Each test runs once using a "file" as input and once using the standard 
input.
After putting the data in the nand, a dump is made. At the end, md5sum 
is run on all the files (source + dump) to check that nothing was corrupted.
What I tested:
- writing just the data (full blocks)
- writing the data+oob (ignoring ecc)
- writing padded data (last block not full, last page not full)
- writing on a weak page: first a write before failure, then a write 
after failure (successful erase)
- writing on a weak page in a weak block: first a write before failure, 
then a write after failure (failed erase)

***********************************

#!/bin/bash

modprobe mtdchar
modprobe mtdblock

# delete previous dump files
rm nand.*.{new,orig}*

# generate data for 16 128k erase blocks without OOB
DATA_SIZE=$(( 16 * 64 * 2048 ))
dd if=/dev/urandom of=nand.data bs=$DATA_SIZE count=1
# generate data for 16 128k erase blocks with OOB
OOB_SIZE=$(( 16 * 64 * (2048 + 64) ))
dd if=/dev/urandom of=nand.oob bs=$OOB_SIZE count=1
# generate data for 16 128k erase blocks minus 8 2k pages minus 1k without OOB
PADDED_SIZE=$(( DATA_SIZE - 8 * 2048 - 1024 ))
dd if=nand.data of=nand.padded bs=$PADDED_SIZE count=1

modprob_nandsim() {
	rmmod -w nandsim
	while [ -e /dev/mtd0 ]; do sleep 0; done
	modprobe nandsim first_id_byte=0xec second_id_byte=0xa1 third_id_byte=0x00 fourth_id_byte=0x15 "$@"
	while [ ! -e /dev/mtd0 ]; do sleep 0; done
}

#==============================================================================
file_data() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim 
	./nandwrite.$1 /dev/mtd0 nand.data \
		&& ./nanddump -o -n -l $DATA_SIZE -f nand.data.$FUNCNAME.$1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
file_data new
file_data orig
#==============================================================================
stdin_data() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim 
	cat nand.data | ./nandwrite.$1 /dev/mtd0 \
		&& ./nanddump -o -n -l $DATA_SIZE -f nand.data.$FUNCNAME.$1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
stdin_data new
stdin_data orig
#==============================================================================
file_oob() {
# note: -l is the length of the data part and doesn't include the length of the OOB
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim 
	./nandwrite.$1 -n -o /dev/mtd0 nand.oob \
		&& ./nanddump -n -l $DATA_SIZE -f nand.oob.$FUNCNAME.$1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
file_oob new
file_oob orig
#==============================================================================
# nandwrite.orig doesn't accept oob with stdin
stdin_oob() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim 
	cat nand.oob |./nandwrite.$1 -n -o /dev/mtd0 \
		&& ./nanddump -n -l $DATA_SIZE -f nand.oob.$FUNCNAME.$1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
stdin_oob new
stdin_oob orig
#==============================================================================
file_padded() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim 
	./nandwrite.$1 -p /dev/mtd0 nand.padded \
		&& ./nanddump -o -n -l $PADDED_SIZE -f nand.padded.$FUNCNAME.$1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
file_padded new
file_padded orig
#==============================================================================
stdin_padded() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim 
	cat nand.padded | ./nandwrite.$1 -p /dev/mtd0 \
		&& ./nanddump -o -n -l $PADDED_SIZE -f nand.padded.$FUNCNAME.$1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
stdin_padded new
stdin_padded orig
#==============================================================================
file_weakpage() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim weakpages=200:1
	./nandwrite.$1 -m /dev/mtd0 nand.data \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
	flash_eraseall /dev/mtd0
	./nandwrite.$1 -m /dev/mtd0 nand.data \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.2 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
file_weakpage orig
file_weakpage new
#==============================================================================
# nandwrite.orig fails because lseek(stdin,...) fails
stdin_weakpage() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim weakpages=200:1
	cat nand.data | ./nandwrite.$1 -m /dev/mtd0 \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
	flash_eraseall /dev/mtd0
	cat nand.data | ./nandwrite.$1 -m /dev/mtd0 \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.2 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
stdin_weakpage orig
stdin_weakpage new
#==============================================================================
# nandwrite.orig fails because the MEMERASE ioctl  fails
file_weakpage_weakblock() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim weakpages=200:1 weakblocks=3:0
	./nandwrite.$1 -m /dev/mtd0 nand.data \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
	flash_eraseall /dev/mtd0
	./nandwrite.$1 -m /dev/mtd0 nand.data \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.2 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
file_weakpage_weakblock orig
file_weakpage_weakblock new
#==============================================================================
# nandwrite.orig fails because lseek(stdin,...) fails
stdin_weakpage_weakblock() {
	echo -e "\n*** $1 - $FUNCNAME"
	modprob_nandsim weakpages=200:1 weakblocks=3:0
	cat nand.data | ./nandwrite.$1 -m /dev/mtd0 \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.1 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
	flash_eraseall /dev/mtd0
	cat nand.data | ./nandwrite.$1 -m /dev/mtd0 \
		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.2 /dev/mtd0 \
		|| echo "** WRITE FAILED, NO DUMP"
}
stdin_weakpage_weakblock orig
stdin_weakpage_weakblock new
#==============================================================================
# weakblock doesn't prevent writing, only erasing and flash_eraseall doesn't
# mark the block as bad so the test is identical to stdin_data
#
#file_weakblock() {
#	echo -e "\n*** $1 - $FUNCNAME"
#	modprob_nandsim weakblocks=3:0
#	./nandwrite.$1 -m /dev/mtd0 nand.data \
#		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.1 /dev/mtd0 \
#		|| echo "** WRITE FAILED, NO DUMP"
#	flash_eraseall /dev/mtd0
#	./nandwrite.$1 -m /dev/mtd0 nand.data \
#		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.2 /dev/mtd0 \
#		|| echo "** WRITE FAILED, NO DUMP"
#}
#file_weakblock orig
#file_weakblock new
#==============================================================================
# weakblock doesn't prevent writing, only erasing and flash_eraseall doesn't
# mark the block as bad so the test is identical to stdin_data
#
#stdin_weakblock() {
#	echo -e "\n*** $1 - $FUNCNAME"
#	modprob_nandsim weakblocks=3:0
#	cat nand.data | ./nandwrite.$1 -m /dev/mtd0 \
#		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.1 /dev/mtd0 \
#		|| echo "** WRITE FAILED, NO DUMP"
#	flash_eraseall /dev/mtd0
#	cat nand.data | ./nandwrite.$1 -m /dev/mtd0 \
#		&& ./nanddump -o -n -m -l $DATA_SIZE -f nand.data.$FUNCNAME.$1.2 /dev/mtd0 \
#		|| echo "** WRITE FAILED, NO DUMP"
#}
#stdin_weakblock orig
#stdin_weakblock new
#==============================================================================
	
# compare all dumps
md5sum nand.*

***********************************

Here is the md5sums I got after running the script:

    82532991bbad8cb4cb4ff2336110d2df  nand.data
    82532991bbad8cb4cb4ff2336110d2df  nand.data.file_data.new
    82532991bbad8cb4cb4ff2336110d2df  nand.data.file_data.orig
    82532991bbad8cb4cb4ff2336110d2df  nand.data.file_weakpage.new.1
    82532991bbad8cb4cb4ff2336110d2df  nand.data.file_weakpage.new.2
    82532991bbad8cb4cb4ff2336110d2df  nand.data.file_weakpage.orig.1
    82532991bbad8cb4cb4ff2336110d2df  nand.data.file_weakpage.orig.2
    82532991bbad8cb4cb4ff2336110d2df 
    nand.data.file_weakpage_weakblock.new.1
    82532991bbad8cb4cb4ff2336110d2df 
    nand.data.file_weakpage_weakblock.new.2
    82532991bbad8cb4cb4ff2336110d2df 
    nand.data.file_weakpage_weakblock.orig.1
    82532991bbad8cb4cb4ff2336110d2df  nand.data.stdin_data.new
    82532991bbad8cb4cb4ff2336110d2df  nand.data.stdin_data.orig
    82532991bbad8cb4cb4ff2336110d2df  nand.data.stdin_weakpage.new.1
    82532991bbad8cb4cb4ff2336110d2df  nand.data.stdin_weakpage.new.2
    82532991bbad8cb4cb4ff2336110d2df  nand.data.stdin_weakpage.orig.1
    82532991bbad8cb4cb4ff2336110d2df 
    nand.data.stdin_weakpage_weakblock.new.1
    82532991bbad8cb4cb4ff2336110d2df 
    nand.data.stdin_weakpage_weakblock.new.2
    82532991bbad8cb4cb4ff2336110d2df 
    nand.data.stdin_weakpage_weakblock.orig.1
    d2d0b957511226438c63fb62f3a27d7e  nand.oob
    d2d0b957511226438c63fb62f3a27d7e  nand.oob.file_oob.new
    d2d0b957511226438c63fb62f3a27d7e  nand.oob.file_oob.orig
    d2d0b957511226438c63fb62f3a27d7e  nand.oob.stdin_oob.new
    b494d881b34cece8e075cfe7226fd939  nand.padded
    befca5c9c358397467b16839b5fa298b  nand.padded.file_padded.new
    befca5c9c358397467b16839b5fa298b  nand.padded.file_padded.orig
    befca5c9c358397467b16839b5fa298b  nand.padded.stdin_padded.new
    befca5c9c358397467b16839b5fa298b  nand.padded.stdin_padded.orig

Some of the tests failed with nandwrite.orig (missing the dump) but all 
pass with nandwrite.new.
Note that in the "padded" case, the dumps don't match the source because 
nandump dumps whole pages so some padding is left in the files. But 
since all the dumps have the same md5sum, if there is a bug in 
nandwrite, my patches didn't cause it ;)
