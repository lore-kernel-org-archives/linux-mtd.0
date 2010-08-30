Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viresh KUMAR <viresh.kumar@st.com>
In-Reply-To: <a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:14:29 +0300
Message-ID: <1283170469.12995.53.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pratyush.anand@st.com, vipulkumar.samar@st.com, bhupesh.sharma@st.com,
	armando.visconti@st.com, Vipin Kumar <vipin.kumar@st.com>,
	shiraz.hashim@st.com, rajeev-dlh.kumar@st.com,
	linux-mtd@lists.infradead.org, deepak.sikri@st.com,
	dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-30 at 16:13 +0530, Viresh KUMAR wrote:
> From: Vipin Kumar <vipin.kumar@st.com>
> 
> For a page size of 4096, the number of oob bytes are 128 per page. This demands
> for an increased ecc_pos array as well as ecc can be placed at more than 64
> locations.
> 
> This patch is added because SPEAr platforms NAND controller has 13 bytes of ecc
> for each 512 bytes of data. This results in 104 bytes of ecc in case of 4096
> byte page.
> 
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>

Nack, breaking ABI Is not allowed in Linux.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
