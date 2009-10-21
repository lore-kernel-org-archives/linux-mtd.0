Subject: Re: [PATCH 3/3 -v3] MTD: Add nand_ecc test module
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: vimal singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790910210206y5a5fda40vccf4162382b09841@mail.gmail.com>
References: <1256114044-12163-3-git-send-email-akinobu.mita@gmail.com>
	<1256115095.29856.338.camel@localhost>
	<ce9ab5790910210206y5a5fda40vccf4162382b09841@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Oct 2009 12:43:18 +0300
Message-Id: <1256118198.29856.343.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-21 at 14:36 +0530, vimal singh wrote:
> > How about a consistent name for the test? All current tests have 'mtd_'
> > prefix. How about make the file to be 'mtd_ecctest.c' ?
> 
> Or 'mtd_nandecctest.c'..? Since, anyways, this test is only for nand.

Fair enough.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
