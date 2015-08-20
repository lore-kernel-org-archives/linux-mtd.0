Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSJZV-0001KI-7J
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 06:43:33 +0000
Message-ID: <1440052973.31419.191.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] ubifs: Remove dead xattr code
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Subodh
 Nijsure <snijsure@grid-net.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Brad Mouring <brad.mouring@ni.com>, Gratian Crisan <gratian.crisan@ni.com>
Date: Thu, 20 Aug 2015 09:42:53 +0300
In-Reply-To: <55D54006.9030700@cn.fujitsu.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <55D54006.9030700@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-08-20 at 10:48 +0800, Dongsheng Yang wrote:
> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> > This is a partial revert of commit 
> > d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
> > ("UBIFS: Add security.* XATTR support for the UBIFS").
> 
> Hi Richard,
> 	What about a full reverting of this commit. In ubifs, we
> *can* support any namespace of xattr including user, trusted, 
> security
> or other anyone prefixed by any words. But we have a 
> check_namespace()
> in xattr.c to limit what we want to support. That said, if we want to
> "Add security.* XATTR support for the UBIFS", what we need to do is
> just extending the check_namespace() to allow security namespace 
> pass.
> And yes, check_namespace() have been supporting security namespace.
> 
> So, IMHO, we do not depend on the generic mechanism at all, and we 
> can
> fully revert this commit.

We just weren't careful enough.

-- 
Best Regards,
Artem Bityutskiy
