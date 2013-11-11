Received: from mail-pd0-f179.google.com ([209.85.192.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vfrrq-0007Fl-JF
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 13:49:27 +0000
Received: by mail-pd0-f179.google.com with SMTP id y10so5210005pdj.38
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 05:49:04 -0800 (PST)
Date: Mon, 11 Nov 2013 13:48:58 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net
Subject: [RFC] New SPI based Serial Flash Controller driver
Message-ID: <20131111134858.GI22184@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: olivier.clergeaud@st.com, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm in the process of porting a BSP SPI based Serial Flash Controller
to the latest kernel version with a view to pushing it upstream.

Historically, this driver was based on some basic functionality
pilfered from the m25p80 driver (mainly the device look-up-table and
thelike), but since then has forked into a fully functional driver in
its own right - due to lack of Dual and Quad Mode support in
Mainline. I am under the impression that support for these modes are
due to land shortly, or the patches are at least on the MLs.

The current theory is that we can start to utilise some of the m25p80
driver, which would alleviate a great deal of duplication by our own
driver. We would still be required to add a smallish driver to
intercept the messages to ensure they are written to the controller in
the correct manor.

Can you tell me if there are any other controllers which work in this
way? If there are can you point me to them please? If not, tell me I'm
spouting nonsense and feel free to advice me on the correct method
that these kinds of things should be handled.

Any help will be gratefully received.

Kind regards,
Lee

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
