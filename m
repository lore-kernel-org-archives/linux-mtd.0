Received: from wx-out-0506.google.com ([66.249.82.232])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnYKp-00063W-IL
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 12:40:11 +0000
Received: by wx-out-0506.google.com with SMTP id s15so856164wxc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Oct 2008 05:40:11 -0700 (PDT)
Date: Wed, 8 Oct 2008 08:38:51 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Philip Rakity <prakity@yahoo.com>
Subject: Re: mtdparts= documentation change
Message-ID: <20081008123851.GB3447@yoda.jdub.homelinux.org>
References: <392584.84807.qm@web58905.mail.re1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <392584.84807.qm@web58905.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 30, 2008 at 11:12:27AM -0700, Philip Rakity wrote:
>Recently I tried to figure out where the name of the mtd disk came from since I was modifying cafe_nand.c to do command line parsing (patch coming for this later in the week).  I could not find an explicit reference so I hacked the code to only find out that it can be easily seen by issuing the command
>
>cat /proc/mtd
>
>I know it also is in the bootup console output (now !)
>.
>
>The following patch would help make explicit how to find the name.

Your patch is whitespace corrupted.  And you don't have a proper
Signed-off-by line.  (It should be before the patch, not part of it.)

And patches should be of strip level 1.

josh
