Received: from web11103.mail.yahoo.com ([216.136.131.150])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TZKk-0000z1-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 02:09:46 +0000
Message-ID: <20020124022048.92877.qmail@web11103.mail.yahoo.com>
Date: Wed, 23 Jan 2002 18:20:48 -0800 (PST)
From: Sheela Kashyap <sheela_kashyap@yahoo.com>
Subject: Jffs - allows cd into a non-directory file?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I have a weird problem. On the jffs installation, I can 'cd' into a
file which is not a directory. For example, I can run:

# cd /etc/services

Once in here, 'ls' fails saying '.' is not a directory. I do not
encounter this problem on the NFS mounted filesystem. I copied the
files for JFFS from the NFS mounted filesystem. When I run 'ls -l' on
/etc/services, the permissions are as expected, that it does not list
that file as a directory. Any suggestions are appreciated. 

Thanks,
Sheela.

__________________________________________________
Do You Yahoo!?
Great stuff seeing new owners in Yahoo! Auctions! 
http://auctions.yahoo.com
