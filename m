From: Kschoo70C@netscape.net (Kschoo70C at netscape.net)
Date: Thu, 13 Feb 2003 06:16:51 -0500
Subject: copy filesystem to nand flash without ecc
Message-ID: <4EF56021.2C81712E.0265FBE9@netscape.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
     I notice some update on the JFFS2 out of band usage in
http://www.linux-mtd.infradead.org/tech/nand.html,
whereby the offset 0x4 used to be ECC valid marker has been made obsolete. In this case, if I write a jffs image to the mtd device without adding the ECC in the out of band area, the nand driver will not know about that. The question here is, what is the consequence of writing an image without adding the ecc to the out of band area ?
Isn't it true the jffs2 file system always uses read_ecc and write_ecc when the flash type is nand ?

Thanks in advance.

regards
choo


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/
