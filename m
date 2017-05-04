Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d65KK-0000XM-1M
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 01:13:06 +0000
Received: by mail-pg0-x22e.google.com with SMTP id o3so3179534pgn.2
 for <linux-mtd@lists.infradead.org>; Wed, 03 May 2017 18:12:43 -0700 (PDT)
Date: Wed, 3 May 2017 18:12:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Ludovic Barre <ludovic.barre@st.com>
Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: allow building with
 COMPILE_TEST
Message-ID: <20170504011239.GB70297@google.com>
References: <20170502011300.137397-1-computersforpeace@gmail.com>
 <a238bf76-828a-5df2-fba7-ebe93939b4a4@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a238bf76-828a-5df2-fba7-ebe93939b4a4@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 03, 2017 at 10:53:12PM +0200, Cyrille Pitchen wrote:
> Hi Brian,
> 
> Le 02/05/2017 à 03:13, Brian Norris a écrit :
> > Cc: Ludovic Barre <ludovic.barre@st.com>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> 
> Do you want me to take it into the github/spi-nor tree or do you want to
> take it directly in the l2-mtd.git tree for 4.12 ?

Did you already? Stephen Rothwell is already reporting build failures.

It's certainly no rush for 4.12. Take it in your tree if you haven't
already, and add #include <linux/sizes.h> while you're at it (the cause
of the build failure).

Brian
