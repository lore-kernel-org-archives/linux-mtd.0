Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFPRG-0000fa-Pz
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 12:03:36 +0000
Received: by wwj40 with SMTP id 40so274540wwj.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 05:03:32 -0700 (PDT)
Subject: Re: nand_base.c:nand_get_flash_type() test results
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Sun, 16 Oct 2011 15:03:05 +0300
In-Reply-To: <4E9851EB.8070909@st.com>
References: <4E95B1B4.7040603@st.com> <1318600673.12351.131.camel@sauron>
	<4E9851EB.8070909@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318766592.2935.19.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-10-14 at 16:14 +0100, Angus CLARK wrote:
> On 10/14/2011 02:57 PM, Artem Bityutskiy wrote:
> > On Wed, 2011-10-12 at 16:26 +0100, Angus CLARK wrote:
> >> Hi All,
> >>
> >> While attempting to add support for some of the more recent NAND devices, I
> >> ended up refactoring nand_get_flash_type() code.  The refactoring was primarily
> >> aimed at simplifying the way in which the growing number 'READID' decoding
> >> exceptions could be accommodated.
> > 
> > Why not to send the refactored code as well?
> > 
> 
> Well, mostly to avoid criticism of it not being based on the mtd-2.6 tree :-)

That's unavoidable - please, base it on the l2-mtd-2.6.git tree:

git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

:-)

>   I
> have attached the file 'nand_id_decode.c' which includes most of the relevant
> code.  If there is interest, I am happy to port to mtd-2.6, but testing on this
> version would be limited to compilation and nandsim.

The situation in MTD is that this is a scarcely populated subsystem
(everyone moves to eMMC) and we have little people who have time to take
your job, transform it into a nice patch, etc.

Your contribution is very appreciated, but please, do one more step -
create a nice patch against l2-mtd-2.6.git, with nice commit message,
and send it to this mailing list and CC Brian Norris. We will look at it
and take it to upstream.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
