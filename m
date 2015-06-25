Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7wvZ-0002eN-4z
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 02:30:09 +0000
Received: by pdbci14 with SMTP id ci14so42794209pdb.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jun 2015 19:29:48 -0700 (PDT)
Date: Wed, 24 Jun 2015 19:29:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 6/6] mtd: docg3: Don't do ERR_PTR(0)
Message-ID: <20150625022940.GT4917@ld-irv-0074>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-7-git-send-email-richard@nod.at>
 <20150617184144.GH4917@ld-irv-0074> <5588FC61.5070202@nod.at>
 <871th2kvia.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871th2kvia.fsf@belgarion.home>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, maximlevitsky@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

On Tue, Jun 23, 2015 at 10:41:33PM +0200, Robert Jarzmik wrote:
> Richard Weinberger <richard@nod.at> writes:
> 
> > Am 17.06.2015 um 20:41 schrieb Brian Norris:
> >> Have you tested this patch?
> >
> > nah, I don't own such a device.
> But I do. If you resend a patch, please Cc me. You can even ask for a test from
> time to time if you want a confirmation, I have a 2 floors docg3 device.

Do you want to be on a MAINTAINERS entry for this driver?

Brian
