Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUled-000072-BR
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2015 01:06:59 +0000
Message-ID: <55DE6130.1060905@cn.fujitsu.com>
Date: Thu, 27 Aug 2015 09:00:32 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Josh Cartwright <joshc@ni.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, Subodh
 Nijsure <snijsure@grid-net.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Brad Mouring <brad.mouring@ni.com>, Gratian Crisan <gratian.crisan@ni.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] ubifs: Remove dead xattr code
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <55D54006.9030700@cn.fujitsu.com>
 <20150826141509.GJ8016@jcartwri.amer.corp.natinst.com>
In-Reply-To: <20150826141509.GJ8016@jcartwri.amer.corp.natinst.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/26/2015 10:15 PM, Josh Cartwright wrote:
> On Thu, Aug 20, 2015 at 10:48:38AM +0800, Dongsheng Yang wrote:
>> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
>>> This is a partial revert of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
>>> ("UBIFS: Add security.* XATTR support for the UBIFS").
>>
>> Hi Richard,
>> 	What about a full reverting of this commit. In ubifs, we
>> *can* support any namespace of xattr including user, trusted, security
>> or other anyone prefixed by any words. But we have a check_namespace()
>> in xattr.c to limit what we want to support. That said, if we want to
>> "Add security.* XATTR support for the UBIFS", what we need to do is
>> just extending the check_namespace() to allow security namespace pass.
>> And yes, check_namespace() have been supporting security namespace.
>
> Is this good enough?  Yes, it'd mean that the xattrs end up on disk, but
> then who's responsible for invoking the selected LSMs inode_init_security() hooks?
> AFAICT, we'd still need to invoke security_inode_init_security for newly
> created inodes (which, Richard's proposed commit still does).

OH, right. My bad!!!! I missed the security_inode_init_security().
Besides to allow security.* prefix in xattr, we still need to call
security_inode_init_security() in ubifs_create(). That's true.

So what we need to remove is only the ubifs_xattr_handlers.

Thanx Josh, you are right.

And Richard, sorry for my bad mind.

Reviewed-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Thanx
Yang
>
> Thanks,
>
>    Josh (who, admittedly, is neither a filesystem nor security module guy :)
>
