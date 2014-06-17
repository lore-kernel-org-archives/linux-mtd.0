Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wwwm8-0005Rf-TT
 for linux-mtd@lists.infradead.org; Tue, 17 Jun 2014 17:02:25 +0000
Received: by mail-qg0-f49.google.com with SMTP id f51so243319qge.22
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2014 10:02:00 -0700 (PDT)
Date: Tue, 17 Jun 2014 10:01:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 0/3] mtd: Add sysfs entries and account BBT blocks
 properly
Message-ID: <20140617170156.GL3599@ld-irv-0074>
References: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140616012112.GA875@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140616012112.GA875@arch.cereza>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Sun, Jun 15, 2014 at 10:21:12PM -0300, Ezequiel Garcia wrote:
> On 21 May 07:06 PM, Ezequiel Garcia wrote:
> > Here's a new round of the patchset to add sysfs entries for the ECC stats
> > struct fields. See the discussion around previous version for context:
[...]
> What's the status of this one? Do we have pending things to discuss?

I wasn't ready to merge this for 3.16, but it looks OK to me. Can you
provide documentation for Documentation/ABI/testing/sysfs-class-mtd?

Brian
