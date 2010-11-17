Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIkHa-00034L-8M
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2010 15:50:50 +0000
Received: by yxj4 with SMTP id 4so835634yxj.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Nov 2010 07:50:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1289649338.2218.42.camel@localhost>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
Date: Wed, 17 Nov 2010 16:50:47 +0100
Message-ID: <AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 13, 2010 at 12:55 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2010-11-13 at 13:07 +0200, Artem Bityutskiy wrote:
>>
>> however, Mike is right, fixes should be back-ports, or if you fix a
>> problem in the older release, you should fix it in the master branch as
>> well, or show that it does not exist in the master branch. This is the
>> only way it is possible to keep development under control.
>>
>> We really need to be sure that whatever is fixed in older releases is
>> also fixed in the newer. Yes, this is more work for you but hey, I'm
>> also doing this stuff in my spare time.
>
> BTW, with patches from Brian Norris which I just pushed the master
> branch may work better for you.

I've managed to build mtd-utils for my android device, using
codesourcery's toolchain. I built a static nanddump executable, copied
it to my device, and ran it. Here's what happened:

# nanddump -f /sdcard/mtd5.dump /dev/mtd/mtd5
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 0
Dumping data starting at 0x00000000 and ending at 0x0a5c0000...
Segmentation fault

The OOB size shown is 0, which is wrong, while the detected block size
and page size are correct. The old version used to complain:

# nanddump -f /sdcard/mtd5.dump /dev/mtd/mtd5
Unknown flash (not normal NAND)

until I did some debugging and found out that my device has an OOB
size of 56... This patch against v1.4.1 fixed that version:

--- a/nanddump.c
+++ b/nanddump.c
@@ -308,6 +308,7 @@ int main(int argc, char * const argv[])
                        !(meminfo.oobsize == 128 && meminfo.writesize == 4096) &
                        !(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
                        !(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
+                       !(meminfo.oobsize == 56 && meminfo.writesize == 2048) &&
                        !(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
                        !(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
                        !(meminfo.oobsize == 8 && meminfo.writesize == 256)) {


I've done some digging around in the new code, but I haven't worked
out exactly why the OOB size is set to 0. I haven't figured out
exactly what it does yet... Or could it have anything to do with my
build environment?

Cheers, Ketil
