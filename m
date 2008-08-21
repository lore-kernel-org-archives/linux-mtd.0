Received: from hs-out-0708.google.com ([64.233.178.241])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBCU-0003gI-Dc
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:31:46 +0000
Received: by hs-out-0708.google.com with SMTP id k27so9120hsc.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:31:44 -0700 (PDT)
Message-ID: <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
Date: Thu, 21 Aug 2008 16:31:44 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
	<6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jared,

On Thu, Aug 21, 2008 at 4:19 PM, Jared Hulbert <jaredeh@gmail.com> wrote:
>> FWIW, I'm not sure it's a good idea to name this new filesystem AXFS.
>> People are almost certainly going to confuse it with XFS despite
>
People that care about their filesystem choice know their choices.
People that don't
care, well they don't care.

Maybe AXIPFS would be the close alternative.

One question on the use-case profiling and subsequent image rebuild:

What if the use-case did not cover all cases of XIP use?

If a compressed page is attempted to be executed, will the filesystem
fall back to decompression to RAM and execution from RAM, or will this
result in a faulty system?

The design choices look real good. Congrats on the achievement.

Regards,
-- 
Leon
