Received: from sh16-54.1blu.de ([178.254.0.106])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNfpo-0006V6-Sa
 for linux-mtd@lists.infradead.org; Sun, 22 Sep 2013 09:20:09 +0000
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: Patching mkfs.ubifs.c for running under Windows
 =?UTF-8?Q?=3F?=
MIME-Version: 1.0
Date: Sun, 22 Sep 2013 11:19:45 +0200
From: gutemine <gutemine@oozoon.de>
In-Reply-To: <CAFLxGvwvoeyhDDD=WqEpw59f8WKKujQo7Pg8mcJOev-7oN-_CQ@mail.gmail.com>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
 <CAFLxGvwvoeyhDDD=WqEpw59f8WKKujQo7Pg8mcJOev-7oN-_CQ@mail.gmail.com>
Message-ID: <5099962fe00dce3a388c4cf305a27d25@localhost>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Richard!

See my comments below.

> Where did you hide it?

I didn't hide it, the ubidump development project just left testing
phase with a first release two weeks ago. I'm coming from the Dreambox
community and we develop plugins for our Linux based SAT receivers, 
therefore our path simply hasn't crossed yet.
 
> Sounds interesting...

Dreamboxes use OpenEmbedded Linux and recently switched their kernel to
3.2 and their Flash Filesystem from jffs2 to ubifs. For booting multiple
images we now needed to have the possibility to extract the ubifs images
directly to an ext4 filesystem on USB sticks.

These receivers often have only 256MB Memory and most of this is already
used. Therefore we soon ran out of memory when extracting images > 128MB
with the existing approaches to mount them via block2mtd or nandsim.
ubiattach of such simulated Flash simply terminated with out of memory
errors in dmesg. 

Therefore I was forced to solve the problem of direct UBIFS extraction
without any emulated Flashdevices and ubifs mounting. ubidump now does
this job nicely and needs less then 2MB of Memory during the extraction,
no matter how big the ubifs image is unless you use the caching option
to reduce IO by loading the whole ubifs image to ram and get faster
extraction on a PC. Then a typical 100 MB ubifs image on my Linux PC is
extracted in 2-3 seconds with about 6000 files. 

You can read the full story of the development project thread at
ubidump.oozoon.de and there you can download also testing kits for
Windows, Linux and mipsel as the Dreamboxes are using Broadcom CPUs. As
ubidump is written in pure C I could easily compile it also for other
plattforms on request.

But be aware due to the lack of help I received from my community I
decided to make ubidump shareware, but you are free to try it for 30
days.

> 
> -ENOPATCH. :-)
> 

I reviwed the changes done for the cygwin version and adding the /dev
and Windows hard and softlink handling would be only another 1-2
codepages, but I agree that it would NOT make live and code maintenance
easier.

> IOW, we need to review it first.
> 

Feel free to test ubidump and if you extract an image under Windows to
an NTFS directory check /dev files to see how I implemented the dummy
files so that you get an idea how mkfs.ubifs would need to read them
when re-creating the ubifs image. Unter Linux off course all files are
dumped natively.

PS: Your FAQ is wrong, now there exists an user space ubifs dump utility
on this planet.

Kind Regards
gutemine
