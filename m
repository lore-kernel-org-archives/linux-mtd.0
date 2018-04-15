Date: Sat, 14 Apr 2018 18:24:00 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] fs: ubifs: Adding new return type vm_fault_t
Message-ID: <20180415012400.GD15294@bombadil.infradead.org>
References: <20180414201859.GA20327@jordon-HP-15-Notebook-PC>
 <5440387.JeuAFZVGCe@blindfold>
 <CAFqt6zYcgj0HQ3Z+xyEstkMCdQ6gnLZ616FiypvM_cys1Fk9vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqt6zYcgj0HQ3Z+xyEstkMCdQ6gnLZ616FiypvM_cys1Fk9vw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 15, 2018 at 02:17:46AM +0530, Souptick Joarder wrote:
> On Sun, Apr 15, 2018 at 2:00 AM, Richard Weinberger <richard@nod.at> wrote:
> > What is the target tree to carry this?
> 
> Target tree I am not sure.
> We have plan to push it in 4.17 release.
> I think Matthew is the right person to get this info.

Please merge it through your tree for 4.18.  Or earlier if you want.
