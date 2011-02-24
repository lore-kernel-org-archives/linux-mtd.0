Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsaTA-0002W2-FF
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 12:38:57 +0000
Received: by iwn36 with SMTP id 36so274156iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Feb 2011 04:38:54 -0800 (PST)
MIME-Version: 1.0
Sender: linus.ml.walleij@gmail.com
In-Reply-To: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
Date: Thu, 24 Feb 2011 13:38:54 +0100
Message-ID: <AANLkTim3yTG-ZEZdhj=ccvd_tXm4XNG7x5uT6qS54sqQ@mail.gmail.com>
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
From: Linus Walleij <linus.walleij@linaro.org>
To: Viresh Kumar <viresh.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/2/23 Viresh Kumar <viresh.kumar@st.com>:

> In most of the cases partitions info, width, etc comes from board files. And
> device structure may be defined in machine files, common to all board files.
> Thus, we need to set platform data from board file, for which
> fsmc_nand_set_plat_data routine is required.

Hm you create a new function, but where is it used? If it's used by a later
patch perhaps you should make a patch series instead?

Yours,
Linus Walleij
