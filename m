Received: from mail-ee0-f54.google.com ([74.125.83.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBUqH-0002BX-Oy
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 18:38:02 +0000
Received: by mail-ee0-f54.google.com with SMTP id c41so2563245eek.27
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 10:37:59 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] mtd-utils: integck improvements
Date: Fri,  1 Mar 2013 19:37:36 +0100
Message-Id: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
Cc: eliedebrauwer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

The past couple of days I've been doing some NAND stress testing on an
i.MX28 platform. So far my observation is that at a certain point 
integck writes a buffer, then tries to verify this data, concludes the
buffer is not what it was written and fails. However the file it saves
(and the contents on flash) appear to be the correct data, hence the 
standard integck wasn't very useful in assisting troubleshooting this 
issue (which only appears once every couple of hours). 

So to step you through the patches:

'verify the operation after datastructure update':

At first integck failed with a similar dump:
<quote>
integck:     File Data:
integck:         Offset: 0  Size: 196  Seed: 5999877  R.Off: 0
integck:         Offset: 196  Size: 33  Seed: 4160795  R.Off: 0
integck:         Offset: 229  Size: 1252  Seed: 8070052  R.Off: 0
integck:         Offset: 1481  Size: 612  Seed: 4160795  R.Off: 1285
integck:         Offset: 2093  Size: 6  Seed: 6946586  R.Off: 0
integck:         Offset: 2099  Size: 536  Seed: 4160795  R.Off: 1903
integck:         Offset: 2635  Size: 1562  Seed: 9845455  R.Off: 0
integck:         Offset: 4197  Size: 80  Seed: 702818  R.Off: 0
integck:         Offset: 4277  Size: 115  Seed: 9845455  R.Off: 1642
integck:     9 writes
integck:     ============================================
integck:     Write Info:
integck:         Offset: 826  Size: 357  Seed: 5908448  R.Off: 0
integck:         Offset: 4197  Size: 80  Seed: 702818  R.Off: 0
...
</quote>
And I would expect the file data listing to include at offset 826 something
with a size of 357 and a seed of 5908448. Clearly it is not there (which
is already extremely confusing). The point is that file_write_info first 
updates the raw_write, then verifies the data (passing the new write) 
and only after that updates the write structure. But in file_check_data
only the newly written data is verified (passed as an argument) whilst 
the save_file() function to dump the file uses the raw_writes to recreate
the written data (while raw_writes is only updated after after this check
would have succeeded). Several lines to say that in this patch the verify
only gets called _after_ the datastructures are updated. 

'file_check_data update to dump the buffer':

See my problem description above, the point is that integck in file_check_data
reads a buffer, and then checks if the data is correct,  it will do a 
seek(0), and reread from the same fd. The point is that in the scenario I 
observed integck failed (due to a buffer mismatch) but the it saved (and 
what was in flash) was actually correct. So I modified this function to
dump the buffers to stderr at the moment an error is found.

'path buffer overflow':

In the problem above I've spend several hours waiting for the issue to 
appear, only to had the 'luck' that it was found in a file whose name was
256 bytes in length, resulting in the write to fail. Closer examination 
showed that the buffer to store the path was 256 bytes in length, but this
buffer also includes /tmp and the read/write suffix and should be able to
contain a filename which is up to 255 bytes (NAME_MAX in linux/limits.h)
in size which is a bad fit. So that array is modified to FILENAME_MAX
(stdio_lim.h) and some checking is added to truncate the filename should
it cause an overflow.

The following log shows the first patch in action (see the correct seed), 
and shows why this third patch is needed:
<quote>
integck:     File Data:
integck:         Offset: 0  Size: 1  Seed: 5008310  R.Off: 0
integck:     1 writes
integck:     ============================================
integck:     Write Info:
integck:         Offset: 0  Size: 1  Seed: 5008310  R.Off: 0
integck:         Offset: 0  Size: 1  Seed: 8246352  R.Off: 0
integck:         Offset: 0  Size: 1  Seed: 5078796  R.Off: 0
integck:         Offset: 0  Size: 1  Seed: 2267087  R.Off: 0
integck:         Offset: 0  Size: 1  Seed: 3602680  R.Off: 0
integck:     5 writes or truncations
integck:     ============================================
integck: Saving /tmp/yqcnfygfitaatyeyvffrguegcdttamcnyhowhgieljfuxfipiljsjcbluaeaghwyinkggommsbwnmvekihgnwgiibccpbwfrpxuxwkmnyghnutrudienngxwgorudbskedaaekiuiyqksfazrwzfwbfhzjjqoiulebtlpbfiuffmsnguqkjzqjqizimsmhbqqagaebjdhqwmzdxghiavtcxubegawlgtvstuqurkurpnrckjfkgostdtpg.integ.sav.readn
integck: error!: condition 'w_fd != -1' failed in save_file() at integck.c:1445
integck: error 36 (File name too long)
</quote>

'typo fixes':

Something trivial to end with. 

my 2 cents, feedback welcome but keep me in cc since I'm not on the list.
E.



Elie De Brauwer (4):
  integck.c: Only verify the operation after all datastructures have
    been updated
  integck.c: rework file_check_data to immediately dump the buffer
    containing the errors
  integck.c: Fix buffer overflow in save_file, avoid possible failure
    to write buffers when the filename length is equal to max_name_len
  Typo fixes: avaiable -> available and priortiry ->  priority

 mkfs.jffs2.1                       |   10 +++---
 mkfs.jffs2.c                       |    4 +--
 tests/fs-tests/integrity/integck.c |   61 +++++++++++++++++++++++-------------
 3 files changed, 47 insertions(+), 28 deletions(-)

-- 
1.7.10.4
