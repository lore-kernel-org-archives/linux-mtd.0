Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZ0z-0005Dn-IQ
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:15:13 +0000
Message-ID: <1401264889.983.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "hujianyang@huawei.com" <hujianyang@huawei.com>
Date: Wed, 28 May 2014 11:14:49 +0300
In-Reply-To: <1401264446.983.17.camel@sauron.fi.intel.com>
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org> <538545B4.7070103@huawei.com>
 <1401264104.983.12.camel@sauron.fi.intel.com>
 <1401264446.983.17.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "daniel@makrotopia.org" <daniel@makrotopia.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-28 at 08:07 +0000, Bityutskiy, Artem wrote:
> On Wed, 2014-05-28 at 11:01 +0300, Artem Bityutskiy wrote: 
> > +       /*
> > +        * Good commend describing what we are doing.
> > +        */
> > +       c->probing = 1
> 
> Err, actually:
> 
>           c->probing = silent;
> 
> >         err = ubifs_read_superblock(c);
> > +       c->probing = 0
> >         if (err)
> >                 goto out_free;

I guess you guys got the idea, but just in case, you also will need to
add "if (!c->probing) { ubifs_error() }" in the relevant places.

-- 
Best Regards,
Artem Bityutskiy
