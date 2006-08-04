Received: from nz-out-0102.google.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G93F1-0003rv-PM
	for linux-mtd@lists.infradead.org; Fri, 04 Aug 2006 13:13:46 -0400
Received: by nz-out-0102.google.com with SMTP id s1so72332nze
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Aug 2006 10:13:42 -0700 (PDT)
Message-ID: <e0590900608041013r51dae68ai3e7c4ba4a0543d70@mail.gmail.com>
Date: Fri, 4 Aug 2006 13:13:42 -0400
From: mitsy <mitsy12@gmail.com>
To: "Sergei Shtylyov" <sshtylyov@ru.mvista.com>
Subject: Re: NAND flash writeb fails
In-Reply-To: <44D24A2C.2070002@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <e0590900608031205r5d6c2878wbe21efa540f9ff7d@mail.gmail.com>
	<44D24A2C.2070002@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei,

Thank you for replying. Now I looked at for a while, I believe my
problem was that I didn't set up TLB in the bootloader correctly.
That's why the nand flash works with kernel (2.4.26) but not from my
bootloader. I just need to figure out what is wrong with my TLB setup.

Mitsy

On 8/3/06, Sergei Shtylyov <sshtylyov@ru.mvista.com> wrote:
> Hello, you wrote:
>
> > I have a AMD au1550 based board with NAND flash. When I try to write a
> > command to the flash, it just hangs on writeb(). I can't figure out
> > why it hangs there. Any suggestions?
>
>     First off, what driver and kernel verison you're using?
>
> > Mitsy
>
> WBR, Sergei
>
