Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVZ7S-0001cV-EP
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 05:23:47 +0000
Received: by wibbs8 with SMTP id bs8so35847090wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 22:23:23 -0700 (PDT)
MIME-Version: 1.0
From: Kurozaki m <kurozaki45@gmail.com>
Date: Wed, 11 Mar 2015 01:23:03 -0400
Message-ID: <CANg6kwr1UmTDDoKBLXzuA_qnVcmnCWe+jjhy7tOqG0RTEj2r1A@mail.gmail.com>
Subject: UBIFS power-cut testing
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I really need to do power-cut testing in my device but there is no
documentation on how to do this, just references to integck and the
debugfs tst_recovery file. Where can I find a guide on how to actually
do power-cut testing for UBIFS?

I have a couple of mtd partitions in my flash device, and one of them
I use to store some critical files. The problem is that sometimes
after power failure(I think) it gets corrupted(Master node gets
corrupted) and I'm not able to recover. What I did is I created a
backup volume in the same UBI device so that I have both a data and
backup volume, the critical files are backed up and kept in sync by an
init script and in case corruption occurs I recreate the data
partition and recover the files.

I want to be able to test that my script actually works by doing
power-cut testing emulations, but I have no idea where to begin. I
cross compiled integck for my device and set the corresponding
environment variables, but when I run it all I see is:

pid is 2907

and then nothing happens.

I've thought about opening the actual mtd partition with a hex editor
and finding where the master node is and trying to corrupt it
manually, but I don't know if that would be the best way to test it. I
also don't have the debugfs files that are talked about on the mtd
page, how do I get those? Is there like a switch I have to pass to
ubifs? Do I have to recompile it with that option enabled? How would I
do it? I only saw a section on how to enable debug messages, but
didn't find how to enable this.

Because I'm looking to corrupt the master node and see if my script
works another question is: Is there a master node per ubifs volume? Or
is the master node for the entire UBI device? Can both my backup and
data volume be corrupted at the same time? Because if they can my
script won't work at all. I'm relying on the idea that corruption only
happens to one volume or the other so that it case the data volume
gets corrupted I can recover using the backup volume and in case the
backup volume is corrupted I can recover from the data volume.
