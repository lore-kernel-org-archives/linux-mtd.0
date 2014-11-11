Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo9GE-0008Nf-Qo
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 11:05:23 +0000
Message-ID: <1415703869.22887.132.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/4] UBIFS: Add xattr support for symlinks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ben Shelton <ben.shelton@ni.com>
Date: Tue, 11 Nov 2014 13:04:29 +0200
In-Reply-To: <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've pushed this patch to the master branch. But I did ab amendment.

On Fri, 2014-10-31 at 13:50 -0500, Ben Shelton wrote:
> +static int __ubifs_setxattr(struct inode *host, const char *name,
> +			    const void *value, size_t size, int flags)
>  {

I renamed this to just 'setxattr()', to be consistent wit the rest of
the code where we use the following convention:

* non-static functions start with 'ubifs_'
* static functions use any name, and do not start with 'ubifs_'
* we just do not prefix functions with '__' anywhere, so let's not use
it in xattr.c either.

Artem.
