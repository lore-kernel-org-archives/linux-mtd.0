From: David Woodhouse <dwmw2@infradead.org>
To: Simon Haynes <simon@baydel.com>
In-Reply-To: <40AB3D0A.13074.1F3574@localhost>
References: <40AB3D0A.13074.1F3574@localhost>
Content-Type: text/plain
Message-Id: <1084961366.28151.56.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 19 May 2004 11:09:27 +0100
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
Subject: Re: patch for nand support linux-2.4.21 jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-05-19 at 10:55 +0100, Simon Haynes wrote:
> On 18 May 2004 at 8:59, Teuling, Sieme wrote:
> 
> > Ay!, I guess that means I'm looking at a fairly big merging effort,
> > since using 2.4.26 is unfortunally not an option for me (we already
> > ported 2.4.21 to an embedded platform).
> 
> I used an ilookup patch for 2.4.21 and this seemed to work for me.
> I got mine from the web but I think there is a patch in cvs mtd/patches

It's buggy. There are other fixes to it in 2.4.26.

-- 
dwmw2
