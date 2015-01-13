Received: from mail-yh0-x235.google.com ([2607:f8b0:4002:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAtHf-0006vT-Ey
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 04:40:52 +0000
Received: by mail-yh0-f53.google.com with SMTP id i57so441428yha.12
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 20:40:30 -0800 (PST)
Date: Mon, 12 Jan 2015 20:40:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: Re: [PATCH] jffs2: compr_rubin: Remove unused function
Message-ID: <20150113044026.GN9759@ld-irv-0074>
References: <1420994209-20980-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420994209-20980-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 11, 2015 at 05:36:48PM +0100, Rickard Strandqvist wrote:
> Remove the function pulledbits() that is not used anywhere.
> 
> This was partially found by using a static code analysis program called cppcheck.
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Pushed to l2-mtd.git. Thanks.

Brian
