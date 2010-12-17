Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTdiH-00080o-Uv
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 17:03:26 +0000
Received: by bwz14 with SMTP id 14so1095896bwz.30
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2010 09:01:20 -0800 (PST)
Subject: Re: [PATCH V2 25/69] ST SPEAr: Add smi driver for serial NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: viresh kumar <viresh.kumar@st.com>
In-Reply-To: <4D0B424A.2020105@st.com>
References: <cover.1285933331.git.viresh.kumar@st.com>
	<238bd0ff57f8530c597157bc07f6c46dc362e1bc.1285933331.git.viresh.kumar@st.com>
	<4CBD32EB.5050409@st.com> <4CCAB4D8.90807@st.com>
	<4D0B424A.2020105@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Dec 2010 19:00:41 +0200
Message-ID: <1292605241.2412.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pratyush ANAND <pratyush.anand@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	Amit VIRDI <amit.virdi@st.com>, Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-17 at 16:28 +0530, viresh kumar wrote:
> Is this patch OK? Actually i have sent this patch as part of a big patchset.
> And my whole patchset is on hold untill i get this acked.
> Please see if you can get some time to review this patch.

Would be simpler if you can separate mtd pieces.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
