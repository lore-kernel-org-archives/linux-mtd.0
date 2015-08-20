Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSJbu-0003il-OZ
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 06:46:03 +0000
Subject: Re: [PATCH 1/2] ubifs: Remove dead xattr code
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <55D54006.9030700@cn.fujitsu.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Subodh Nijsure <snijsure@grid-net.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Brad Mouring <brad.mouring@ni.com>,
 Gratian Crisan <gratian.crisan@ni.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D57791.4000302@nod.at>
Date: Thu, 20 Aug 2015 08:45:37 +0200
MIME-Version: 1.0
In-Reply-To: <55D54006.9030700@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.08.2015 um 04:48 schrieb Dongsheng Yang:
> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
>> This is a partial revert of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
>> ("UBIFS: Add security.* XATTR support for the UBIFS").
> 
> Hi Richard,
>     What about a full reverting of this commit. In ubifs, we
> *can* support any namespace of xattr including user, trusted, security
> or other anyone prefixed by any words. But we have a check_namespace()
> in xattr.c to limit what we want to support. That said, if we want to
> "Add security.* XATTR support for the UBIFS", what we need to do is
> just extending the check_namespace() to allow security namespace pass.
> And yes, check_namespace() have been supporting security namespace.

You're right. I thought/hoped we can re-use some parts of it.
Se let's do a full revert. I'll send a v2 patch in a jiffy.

> So, IMHO, we do not depend on the generic mechanism at all, and we can
> fully revert this commit.
> 
> But strange to me, why we picked this commit for ubifs? Artem, is there
> something I am missing?

TBH, I fear nobody noticed. :(

Thanks,
//richard
