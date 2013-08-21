Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCFCA-0004ji-UI
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 20:39:59 +0000
Date: Wed, 21 Aug 2013 15:06:05 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
Message-ID: <20130821190604.GA14552@logfs.org>
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
 <20130821073028.GB31788@brian-ubuntu> <87li3v79uo.fsf@nemi.mork.no>
 <20130821084154.GE31788@brian-ubuntu> <52148F7B.7090409@iki.fi>
 <CAN8TOE9Ed=2YgV7L7gHB7FZC8OyE9=vr=6rVUQDPoK54NHh3ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE9Ed=2YgV7L7gHB7FZC8OyE9=vr=6rVUQDPoK54NHh3ZA@mail.gmail.com>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-usb@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 August 2013 13:00:15 -0700, Brian Norris wrote:
> 
> Yes, that's a good point. Quoting Documentation/stable_kernel_rules.txt:
> 
> "It must be obviously correct and tested."
> 
> Seeing as it was not tested, I am dropping the patch entirely (it is
> not stable material, and there is no point including it along with the
> driver removal).

Thank you!  Without quoting rules, this also fails the common sense
test.  For a stable patch, one might assume a non-empty group of
people that would benefit from said patch and care enough to install
the patch.

Jörn

--
I have always found the word "Europe" in the mouth of those politicians
that were demanding something from other powers they did not dare demand
in their own name.
-- Otto von Bismarck
