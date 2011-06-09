Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUaQq-000279-Q7
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 08:17:37 +0000
Received: by fxm14 with SMTP id 14so1154493fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 01:17:33 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 11:13:14 +0300
Message-ID: <1307607194.7374.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, would you please send a new series? I suggest you the following
order of things.

1. clean-up of non-DEBUG() messages.
   1.1. go through all printks and check if KERN_* is ok, fix. E.g.,
        I can see that all KERN_DEBUG should become KERN_INFO
   1.2. go through all printks and check if the function name prefix
        makes sense there - kill those which do not.

   Also, while doing this, keep in mind that messages will be later
   turned into dev_* (dev_info(), dev_err(), etc) so they will be
   automatically prefixed with the device name which is already some
   identification of the source of the message.

   1.3. turn messages to dev_*
   1.4. make another pass and do all the lines consolidations,
        alignments, punctuation, etc etc.

2. clean-up of DEBUG() cruft.
   2.1 change DEBUG() with dev_dbg()

   Kill all function name prefixes as well. The rationale is: dev_dbg()
   already adds function name prefixe (and process id) if dynamic
   debugging is enabled. In case of debugging with DEBUG macro, you
   anyway have to change the code (adding #define DEBUG) so you might
   easily defind pr_fmt at the same time for youself.

How does this sound to you?

FWIW: I've moved the patches I pushed from the master branch to the
"brian" branch of l2-mtd-2.6.git tree. But they will not be useful
for you, I guess.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
