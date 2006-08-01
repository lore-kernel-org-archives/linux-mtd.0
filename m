Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7v0y-0001gT-Qa
	for linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 10:14:37 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1365753ugc
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Aug 2006 07:14:30 -0700 (PDT)
Message-ID: <625fc13d0608010714u48a7e582qea5a719b4b0aab55@mail.gmail.com>
Date: Tue, 1 Aug 2006 09:14:30 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] JFFS2 superblock support
In-Reply-To: <1154440001.30995.7.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1154440001.30995.7.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/1/06, Artem B. Bityutskiy <dedekind@infradead.org> wrote:
> David,
>
> here is the patch which adds superblock node support to JFFS2 (we talked
> about this). The superblock node has no useful data so far - this patch
> just adds general support.

I forget exactly why a super block should be added.  Could you refresh
my memory?

josh
