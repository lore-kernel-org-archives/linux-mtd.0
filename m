Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7iLw-0006I8-69
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 07:10:34 +0000
From: Stefan Roese <sr@denx.de>
To: Vipin Kumar <vipin.kumar@st.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
Date: Wed, 14 Mar 2012 08:10:10 +0100
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1331647621.3595.64.camel@sauron.fi.intel.com> <4F603BC0.7050808@st.com>
In-Reply-To: <4F603BC0.7050808@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201203140810.10964.sr@denx.de>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Armando VISCONTI <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 March 2012 07:33:36 Vipin Kumar wrote:
> On 3/13/2012 7:37 PM, Artem Bityutskiy wrote:
> > On Tue, 2012-03-13 at 14:36 +0100, Stefan Roese wrote:
> >> No problem.
> >> 
> >> But the patch still applies clean onto kernel.org.
> > 
> > OK.
> 
> I am sorry for pitching in too late. It seems that Stefan, Linus and I
> have sent the same patch (in the same order) achieving same result. It
> was a mistake on my part to not have rebased on either of these patches.
> 
> Artem, please suggest how to proceed as there would be conflicts if you
> try to apply Stefan's patch before my patch-set

I suggest to just drop my patch then, since I still have to rebase it on-top 
of the l2 tree. So easiest is most likely, to apply Vipins's patchset now.

Okay?

Thanks,
Stefan
