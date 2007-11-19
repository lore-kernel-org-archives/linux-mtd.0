Date: Mon, 19 Nov 2007 14:23:08 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
In-Reply-To: <1195271177.2533.174.camel@shinybook.infradead.org>
Message-ID: <Pine.LNX.4.64.0711191419220.20455@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195271177.2533.174.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roman.borisov@intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

> For reasons not entirely clear to me, one of Artem's "debug cleanup"
> patches seems to have completely abandoned the CRC check on data nodes.
> Artem, can you explain commit 733802d974e5af42acb7cd61b16c0ce6dd03b7ed
> for us?
> 
> This seems to make it happy on your two test cases. Note that in your
> 'NEW_FILE' test case, the original node at 0x34000C has already been
> marked obsolete by a buggy kernel, so I needed to mark it valid again:
>  echo -en \\xe0 | dd of=NEW_FILE bs=1 conv=notrunc seek=$((0x34000f)) count=1
> 
> Please test, and then I'll commit it.
> 
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
>
The patch you sent solved the issue for both generic NOR and Sibley.
Commit it please.

Thanks,
Alexey and Roman
