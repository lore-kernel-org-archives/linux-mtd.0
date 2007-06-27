Received: from wa-out-1112.google.com ([209.85.146.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3Vrx-0002IT-UX
	for linux-mtd@lists.infradead.org; Wed, 27 Jun 2007 07:39:34 -0400
Received: by wa-out-1112.google.com with SMTP id v33so160647wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Jun 2007 04:39:32 -0700 (PDT)
Message-ID: <8bf247760706270439t1b56157dy9671d903fb3aea8f@mail.gmail.com>
Date: Wed, 27 Jun 2007 17:09:32 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 New bie queries.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have creating a few files in my jffs2 file system.

When i do command 'du -sh' i get a size which is totally different
from command 'df' (disk free)

Im using busybox.

[root@LocalHost user]#df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock8           61440     15508     45932  25% /
none                     14760        40     14720   0% /tmp

Which i can confirm is Wrong. I have created files in / which are of
size around 40MB.
This is reflected by the output of command 'du'

[root@LocalHost user]#du -h
39.6M


I dont know why both of the commands are giving different sizes.


Regards,
sriram
