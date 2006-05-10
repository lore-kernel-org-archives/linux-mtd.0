Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdnQY-0006DU-BM
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 08:04:39 -0400
Message-ID: <4461D69C.3010909@ak.jp.nec.com>
Date: Wed, 10 May 2006 21:03:40 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, dedekind@infradead.org
References: <445C476A.2090506@ak.jp.nec.com>	
	<1147255421.16853.28.camel@sauron.oktetlabs.ru>
	<1147259209.2794.178.camel@pmac.infradead.org>
In-Reply-To: <1147259209.2794.178.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joern@wohnheim.fh-wedel.de
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>> Few suggestions for now (again cosmetic):
>>
>> 1. GC-related functions and summary-related functions should be moved to
>> gc.c and summary.c
> 
> Then they'd need ifdefs. I'd prefer to keep them where they are, in
> separate files which aren't compiled if the XATTR options are disabled.

I also agree David's opinion.

In addition, those functions are deployed enough locally-separating
in xattr.c.
Sorry, I could not understand your dissatisfaction.

>> 2. JFFS2 uses namings we all are used to. E.g., c - JFFS2 superblock
>> structure, ref - struct jffs2_node_ref. I've noticed you use 'ref' as
>> jffs2_xattr_ref pointers which is just a bit confusing. I would suggest
>> you calling them 'xref' - this would improve readability a bit.
> 
> Really, I don't think it matters.
> 
>>> +		delete_xattr_ref(c, ref);
>>> +		delete_xattr_ref(c, xref);
> 
>> It's minor, but still.
> 
> It's not even 'minor'. It's total bullshit. If you can't look at the
> function name "delete_XATTR_REF" and work out what 'ref' is in that
> context, then you really shouldn't be trying to read the code. Life is
> hard; let's go shopping.

Is the 'raw' used as the common name for jffs2_raw_node_ref, not 'ref',
isn't it? Because I thought those are not confusable, I adopted 'ref'
as a name of jffs2_xattr_ref.

If we can arrive an agreement that it's confusable naming scheme,
I'll prepare to change the common name of jffs2_xattr_ref.
Both naming schemes are acceptable for me.

It's important to decide what should be decided at first, I think.

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
