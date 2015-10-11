Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlMo0-0003i9-2s
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2015 20:01:16 +0000
Received: by qgez77 with SMTP id z77so107743059qge.1
 for <linux-mtd@lists.infradead.org>; Sun, 11 Oct 2015 13:00:54 -0700 (PDT)
Date: Sun, 11 Oct 2015 13:00:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 1/5] mtd: mtdpart: add debug prints to partition parser.
Message-ID: <20151011200010.GA3696@localhost>
References: <cover.1439911625.git.hramrach@gmail.com>
 <5b636f504e32c9fe83df22694656075f4f45c710.1439911625.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b636f504e32c9fe83df22694656075f4f45c710.1439911625.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 03:34:07PM -0000, Michal Suchanek wrote:
> The probe of a mtd device can fail when a partition parser returns
> error. The failure due to partition parsing can be quite mysterious when
> multiple partitioning schemes are comiled in and any of them can fail
> the probe.
> 
> Add debug prints which show what parsers were tried and what they
> returned.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
> v2:
> 
>  - reformat debug messages

Looks OK to me. Applied to l2-mtd.git.
