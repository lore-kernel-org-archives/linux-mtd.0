MIME-Version: 1.0
In-Reply-To: <1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
	<1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 14 Jul 2011 13:10:09 -0400
Message-ID: <CAMjpGUeU04ziDWyxjgY52xHYxqQZGjzsn6JcJa3X0FR33AGDSw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: dataflash: add device tree probe support
To: Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, patches@linaro.org,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	devicetree-discuss@lists.ozlabs.org,
	Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

shouldnt there be #ifdef's around this ?  not everyone supports devicetrees.
-mike
