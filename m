Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7tJj-0006Be-6X
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 16:11:43 +0000
Subject: Re: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091103141903.23d0d0be@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
	<20091103141903.23d0d0be@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Nov 2009 18:11:33 +0200
Message-Id: <1257869493.21596.809.camel@localhost>
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

On Tue, 2009-11-03 at 14:19 +0100, Simon Kagstrom wrote:
> The last messages which happens before a crash might contain interesting
> information about the crash. This patch reworks mtdoops using the
> kmsg_dumper support instead of a console, which simplifies the code and
> also includes the messages before the oops started.
> 
> On oops callbacks, the MTD device write is scheduled in a work queue (to
> be able to use the regular mtd->write call), while panics call
> mtd->panic_write directly. Thus, if panic_on_oops is set, the oops will
> be written out during the panic.
> 
> A parameter to specify which mtd device to use (number or name), as well
> as a flag, writable at runtime, to toggle wheter to dump oopses or only
> panics (since oopses can often be handled by regular syslog).
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>

Do we really need this notifiers? Would not it be better to open mtd
device straight in the module_init function instead?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
