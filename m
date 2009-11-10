Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N7nS1-00045w-Ss
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 09:55:53 +0000
Date: Tue, 10 Nov 2009 10:55:21 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20091110105521.613a6fe9@marrow.netinsight.se>
In-Reply-To: <20091103141903.23d0d0be@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
	<20091103141903.23d0d0be@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Tue, 3 Nov 2009 14:19:03 +0100
Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:

> The last messages which happens before a crash might contain interesting
> information about the crash. [...]
> ChangeLog:
>  v13:
> 	* Rebase against http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
> 	* (Artem): Check simple_strtoul output to catch strings which only
> 	  start with numbers
> 	* (Artem): Check that the mtd_index does not exceed MAX_MTD_DEVICES

Are there any more issues which I should fix for this patch to get it
to an acceptable state?

Thanks,
// Simon
