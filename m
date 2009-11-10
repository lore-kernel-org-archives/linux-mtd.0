Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7pIH-0006jy-OL
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 11:53:57 +0000
Subject: Re: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091110105521.613a6fe9@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
	<20091103141903.23d0d0be@marrow.netinsight.se>
	<20091110105521.613a6fe9@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Nov 2009 13:53:41 +0200
Message-Id: <1257854021.21596.728.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-10 at 10:55 +0100, Simon Kagstrom wrote:
> Hi Artem,
> 
> On Tue, 3 Nov 2009 14:19:03 +0100
> Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:
> 
> > The last messages which happens before a crash might contain interesting
> > information about the crash. [...]
> > ChangeLog:
> >  v13:
> > 	* Rebase against http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
> > 	* (Artem): Check simple_strtoul output to catch strings which only
> > 	  start with numbers
> > 	* (Artem): Check that the mtd_index does not exceed MAX_MTD_DEVICES
> 
> Are there any more issues which I should fix for this patch to get it
> to an acceptable state?

Sorry Simon, I just do not have enough time ATM. But I will look at this
ASAP. It is in my TODO queue.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
