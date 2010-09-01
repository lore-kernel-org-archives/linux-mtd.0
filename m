Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
In-Reply-To: <4C7DD2FD.1080501@st.com>
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>
	<1283170469.12995.53.camel@brekeke>  <4C7CA278.9040902@st.com>
	<1283297810.2018.67.camel@brekeke>  <4C7DD2FD.1080501@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 13:45:39 +0300
Message-ID: <1283337939.1958.20.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
	Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 09:43 +0530, Vipin Kumar wrote:
> On 9/1/2010 5:06 AM, Artem Bityutskiy wrote:
> > Hi,
> > 
> > On Tue, 2010-08-31 at 12:04 +0530, Vipin Kumar wrote:
> >>> Nack, breaking ABI Is not allowed in Linux.
> >> I could not understand your point. Can you please elaborate. How does this patch 
> >> break ABI
> > 
> > You are changing data structure (struct nand_ecclayout) used for in MTD
> > ioctl. Tha ioctl is part of the Linux ABI. By changing the data
> > structure, you are breaking the ABI. This means that current binaries
> > would stop working with newer versions of the Linux kernel if we'd
> > accept your patch.
> > 
> Hello,
> 
> The only change that I have made is increasing the number of bytes to keep ecc. 

Right, but this break ABI.

> Since the ecc is generally kept in spare area, it makes sense to have the ecc 
> locations to be equal to the maximum spare area possible.

May be.

> A NAND page with a page size of 4096 would contain a spare area of 128 bytes. 
> Now, ecc for the page can be less/more than 64 bytes(currently allocated for 
> ecc positions) depending on the algorithm used to generate ecc. 
> Incidently, in our case the ecc can fit in 104 bytes and this is still quite 
> logical to place it in spare area since the linux image supports 4096 page but 
> the problem is that the ecc locations supported by linux are less than the 
> practically possible scenario so in effect this change is an improvement in linux

Yes, this is historical and a bit unfortunate, but you cannot break ABI
even if you have reasons like that

> Please let me know if you disagree

Please, create an app which uses 'struct nand_ecclayout' and compile it
against the old headers. Check that it works. Then do you kernel
modification and run the same program (without re-compiling) and my
prediction is that it won't work. This is what I call ABI breaking which
is disallowed.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
