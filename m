Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wwx27-0001j6-9I
 for linux-mtd@lists.infradead.org; Tue, 17 Jun 2014 17:18:55 +0000
Date: Tue, 17 Jun 2014 14:17:48 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: Add sysfs entries and account BBT blocks
 properly
Message-ID: <20140617171748.GA28929@arch.cereza>
References: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140616012112.GA875@arch.cereza>
 <20140617170156.GL3599@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140617170156.GL3599@ld-irv-0074>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 Jun 10:01 AM, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Sun, Jun 15, 2014 at 10:21:12PM -0300, Ezequiel Garcia wrote:
> > On 21 May 07:06 PM, Ezequiel Garcia wrote:
> > > Here's a new round of the patchset to add sysfs entries for the ECC stats
> > > struct fields. See the discussion around previous version for context:
> [...]
> > What's the status of this one? Do we have pending things to discuss?
> 
> I wasn't ready to merge this for 3.16, but it looks OK to me. Can you
> provide documentation for Documentation/ABI/testing/sysfs-class-mtd?
> 

Dammit! I forgot about that requirement from Greg's feedback.

Let me respin.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
