Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeUcl-0007qa-K1
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 18:48:12 +0000
Date: Thu, 7 Nov 2013 15:47:52 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [mtd] possible bug in nandsim
Message-ID: <20131107184751.GB30917@localhost>
References: <527B7CD1.1020105@codeaurora.org>
 <CAFLxGvx=8vcDzUcA6vG_84X8snYkDLBkyboQZmDTUdDgi3xccQ@mail.gmail.com>
 <20131107145848.GA32004@localhost>
 <527BD5C2.8050903@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <527BD5C2.8050903@codeaurora.org>
Cc: pratibha@codeaurora.org, Richard Weinberger <richard.weinberger@gmail.com>,
 dedekind@oktetlabs.ru, fastcat@gmail.com, dedekind@infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 08:02:42PM +0200, Tanya Brokhman wrote:
> Hello Ezequiel,
> 
> On 11/7/2013 4:58 PM, Ezequiel Garcia wrote:
> > AFAIK Richard is right, the feature is just a non-persistent cache.
> >
> > However a patch was submitted (and never reviewed) recently to
> > apparently add persistent behavior:
> >
> >    http://patchwork.ozlabs.org/patch/277974/
> >
> > Tanya: Can you test or review the patch and provide a formal
> > Tested/Reviewed-by? I'd be interested in seeing that move forward :)
> >
> > Thanks!
> >
> 
> This is exactly the behavior I need for my testing purposes! Thank you. 

You're welcome.

> At the moment I have that with my (ugly) fix. I will try to validate 
> your patch and help it get integrated.
> 

FWIW: it's not "my" patch.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
