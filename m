Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
In-Reply-To: <4C7E3344.2020202@st.com>
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>
	<1283170469.12995.53.camel@brekeke>  <4C7CA278.9040902@st.com>
	<1283297810.2018.67.camel@brekeke>  <4C7DD2FD.1080501@st.com>
	<1283337939.1958.20.camel@brekeke>  <4C7E3344.2020202@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 02:23:25 +0300
Message-ID: <1283383405.2209.66.camel@brekeke>
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

Hi,

On Wed, 2010-09-01 at 16:34 +0530, Vipin Kumar wrote:
> I got the point, but this change is essential (at least for me). It may be 
> essential to others as well in near future. Please let me know how to handle more 
> than 64 bytes of ecc

Invent new ioctl, and declare the old one deprecated.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
