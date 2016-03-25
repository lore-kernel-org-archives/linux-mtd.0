Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajQHa-0005e3-Ey
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 11:52:02 +0000
Message-ID: <1458906697.615.20.camel@gmail.com>
Subject: Re: ubiblock RW
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Richard Weinberger
 <richard@nod.at>
Cc: Benson Young <benson6877@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Gstir <david@sigma-star.at>, Willy
 Tarreau <w@1wt.eu>
Date: Fri, 25 Mar 2016 13:51:37 +0200
In-Reply-To: <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
 <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-03-24 at 18:26 -0300, Ezequiel Garcia wrote:
> > > Richard, what do you think?
> > I'm definitely not fond of adding write support to ubiblock without
> > turning it into a proper FTL.
> > Otherwise it will be abused and will cause serious damage.
> > 
> I'm not sure this statement makes much sense without actual numbers.

Ezequel,

could you re-summarize how the write support would be implemented? Read
entire LEB, modify data block (512 bytes), atomically write the LEB?
This would not perform well, but would probably work.

Or you want to avoid atomic LEB change and just erase the LEB and write
the entire LEB with the updated contents? This would probably be a bit
faster, but not power-cut safe.
