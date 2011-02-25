Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstDV-000269-4r
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 08:40:02 +0000
Received: by pzk7 with SMTP id 7so238963pzk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 00:39:59 -0800 (PST)
MIME-Version: 1.0
Sender: linus.ml.walleij@gmail.com
In-Reply-To: <4D6725AA.3070204@st.com>
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
	<AANLkTim3yTG-ZEZdhj=ccvd_tXm4XNG7x5uT6qS54sqQ@mail.gmail.com>
	<4D6725AA.3070204@st.com>
Date: Fri, 25 Feb 2011 09:39:58 +0100
Message-ID: <AANLkTi=aJ60k=h14_ZUQ3T+EZuNZvqx2_yQQU_xnqDCn@mail.gmail.com>
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
From: Linus Walleij <linus.walleij@linaro.org>
To: viresh kumar <viresh.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/2/25 viresh kumar <viresh.kumar@st.com>:
> On 02/24/2011 06:08 PM, Linus Walleij wrote:
>> 2011/2/23 Viresh Kumar <viresh.kumar@st.com>:
>>
>>> > In most of the cases partitions info, width, etc comes from board files. And
>>> > device structure may be defined in machine files, common to all board files.
>>> > Thus, we need to set platform data from board file, for which
>>> > fsmc_nand_set_plat_data routine is required.
>> Hm you create a new function, but where is it used? If it's used by a later
>> patch perhaps you should make a patch series instead?
>
> Actually it will be used in SPEAr patches, which will be sent separately. I could
> have kept it as part of that series also, but just thought to send it separately.
> You want me to keep it in spear patch series instead?

Nah no problem I get it now...
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
