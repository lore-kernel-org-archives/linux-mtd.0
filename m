Date: Thu, 25 Feb 2016 09:57:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas.Betker@rohde-schwarz.com, Joakim.Tjernlund@infinera.com,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "deng.chao1@zte.com.cn" <deng.chao1@zte.com.cn>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mtd-bounces@lists.infradead.org"
 <linux-mtd-bounces@lists.infradead.org>,
 "liu.ming50@gmail.com" <liu.ming50@gmail.com>,
 "sztomi89@gmail.com" <sztomi89@gmail.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "wangzaiwei@top-vision.cn" <wangzaiwei@top-vision.cn>
Subject: Re: JFFS2 deadlock
Message-ID: <20160225175732.GA65553@google.com>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
 <1453910781.20662.35.camel@infinera.com>
 <20160128000559.GA14270@google.com>
 <OF7C1394C5.2BBD0A26-ONC1257F48.002BF506-C1257F48.002D6C9C@rohde-schwarz.com>
 <1454336914.133285.297.camel@infradead.org>
 <OF2969B332.8B296F0B-ONC1257F4C.006307EB-C1257F4C.0067DE44@LocalDomain>
 <OF19585295.84AA7860-ONC1257F5D.0031E02A-C1257F5D.0036B10E@rohde-schwarz.com>
 <1456386428.3632.2.camel@infinera.com>
 <OF5573B33B.57B4C4FF-ONC1257F64.0036346C-C1257F64.0036BD81@rohde-schwarz.com>
 <1456399332.4666.26.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456399332.4666.26.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 25, 2016 at 11:22:12AM +0000, David Woodhouse wrote:
> OK, of the four fixes I had in my branch, three are Cc:stable and I
> have pushed them to linux-mtd.git. I'll give them a day or two in
> linux-next and then send a pull request.
> 
> The fourth, which is just a mount speedup, I've put in l2-mtd.git.
> 
> Brian, was that the right way to do it? I feel like an impostor pushing
> to my own repositories now :)

Nope, that's perfect. Happy to have a JFFS2 maintainer again :)

(Feel free to send the MAINTAINERS update that's also in
linux-mtd.git/master. It was meant to ride along with whatever else
needed pushed to Linus.)

Brian
