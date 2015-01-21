Received: from mail-ie0-f180.google.com ([209.85.223.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDuvY-0007nG-18
 for linux-mtd@lists.infradead.org; Wed, 21 Jan 2015 13:02:33 +0000
Received: by mail-ie0-f180.google.com with SMTP id rl12so7898144iec.11
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2015 05:02:10 -0800 (PST)
Date: Wed, 21 Jan 2015 13:02:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 08/13] mtd: st_spi_fsm: Update the JEDEC probe to
 handle extended READIDs
Message-ID: <20150121130204.GC22024@x1>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <1418644760-18773-9-git-send-email-lee.jones@linaro.org>
 <20150113050715.GQ9759@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150113050715.GQ9759@ld-irv-0074>
Cc: Angus Clark <angus.clark@st.com>, kernel@stlinux.com,
 linux-kernel@vger.kernel.org, Carmelo Amoroso <carmelo.amoroso@st.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Jan 2015, Brian Norris wrote:

> On Mon, Dec 15, 2014 at 11:59:15AM +0000, Lee Jones wrote:
> > The previous code was based on 3-byte JEDEC IDs, with a possible 2-byte
> > extension.  However, devices are now emerging that return 6 or more bytes of
> > READID data and the additional bytes are required to differentiate between
> > variants or generations of similar devices.
> > 
> > This patch refactors the device table and JEDEC probe code to handle arbitrary
> > length READIDs, with the standard JEDEC definition now becoming a special case.
> > Functionally, there should be no change in behaviour.  A subsequent patch will
> > update the table with extended READIDs where applicable.
> 
> BTW, how's that promise going, where you work on adapting this driver to
> the spi-nor framework? We've already done some of this same work there.

I have pushed this point within ST and someone has agreed to do the
work.  Last I heard it relied on these patches, but I'll ask again.

> > +#define RDID(...) __VA_ARGS__  /* Dummy macro to protect array argument. */
> 
> What? What needs "protected"?

You're asking me questions I can't answer I'm afraid and Angus has now
left the building.  I guess he thinks __VA_ARGS__ will prevent some
kind of overflow?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
