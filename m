Received: from mail.sdt.be ([81.83.20.17] helo=remote.sdt.be)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWk7m-0001qq-Eb
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 08:39:39 +0000
From: David MONTICELLI <david@sdt.be>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: huge rootfs mount time at boot
Date: Fri, 9 Nov 2012 08:38:50 +0000
Message-ID: <8F58A6635F694F4A9BB3FB4CE69A335C08467548@PANDORA.sdt.local>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


Our embedded linux is using a NOR flash.

Recently I have noticed the following:

1) I erase the root fs partition from uboot
2) I tftp the root fs image from uboot
3) I boot up on 25 sec

4) I SCP 2 files of 14 Mb each to /home
5) I boot up on 45 sec
6) I delete those 2 files
7) I still boot up on 45 sec!
8) To boot up on 25 sec again, I have to erase root fs from uboot

Note:
     Since I have noticed that behavior, I have searched and learnt a lot, =
so I have now selected the "End block Summary"
      For JFFS2 into menu config, have rebuilt everything and remake the jf=
fs2 images.

      After having modified a small program(www.embedded-linux.co.uk/downlo=
ads/nand_check.tar.gz) found here    (http://www.embedded-linux.co.uk/tutor=
ial/jffs2-summary) to make it works for NOR flash; I can see that blocks of=
 my    root fs Image correctly end with EBS; but next blocks don't (like th=
e ones about the 2 files I've added).
        Then I have tried the "pad" option from the menu config, to pad the=
 root fs image with 0xff to the size of my root      fs partition; but the =
result is that my root fs jffs2 image size remain the same as before having=
 checked the   "pad(size)" option.


Could you please tell me why it acts like that (slow mount even after havin=
g deleted the 2 files) and how to fix it?



Thanks in advance,

David


David MONTICELLI Developer & IT Administrator
SDT International sa-nv
Boulevard de l'Humanit=E9 415
1190 Brussels - Belgium
Tel: +32 2 332 32 25
www.sdt.eu
