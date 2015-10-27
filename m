Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrD4R-0005cd-9l
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 22:50:23 +0000
Received: by pacfv9 with SMTP id fv9so245839889pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 15:50:02 -0700 (PDT)
Date: Tue, 27 Oct 2015 15:50:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding
 specification
Message-ID: <20151027225000.GA64073@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost>
 <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,

Thanks for the review.

On Mon, Oct 26, 2015 at 11:35:24PM -0500, Rob Herring wrote:
> On Sun, Oct 11, 2015 at 3:04 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > Hi DT maintainers,
> >
> > It's a bit hypocritical of me, since I've been a slow reviewer as well,
> > but... can we get some review on this one? Usually, I'm comfortable
> > taking driver DT bindings without your review, but this one is a bit
> > more generic and is more far-reaching than the average driver.
> 
> Sorry, missed this one. This would be a good one to send to
> devicetree-spec to BTW.

I'm not very familiar with that list. With the intention of getting into
an ePAPR (or similar) spec? Or just for additional review? If the
former, would you suggest codifying both the old and the new, or just
the new?

Brian
