Received: from [80.190.106.10] (helo=taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArXxN-0001P0-F5
	for linux-mtd@lists.infradead.org; Fri, 13 Feb 2004 07:41:49 +0000
From: Florian Schirmer <jolt@tuxbox.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Feb 2004 08:41:46 +0100
References: <20040211232659.2415.qmail@web20729.mail.yahoo.com>
In-Reply-To: <20040211232659.2415.qmail@web20729.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200402130841.46087.jolt@tuxbox.org>
cc: Shawn Jin <shawnxtech@yahoo.com>
Subject: Re: Help: Error on mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> cfi_cmdset_0002: Disabling fast programming due to
> code brokenness.

What MTD version you are using? I recommend to get the latest code from CVS, 
since there was another bug in the cmdset2. You should in fact get two 
"Disabled X due to bugs" messages.

Regards,
   Florian
