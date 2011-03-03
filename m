Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PvHVs-0003kk-C4
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2011 23:00:53 +0000
From: "Marco Cesarano" <mcesaran@broadcom.com>
To: "Anatolij Gustschin" <agust@denx.de>
Date: Thu, 3 Mar 2011 15:00:36 -0800
Subject: RE: UBI power cut
Message-ID: <2B8D104E6375C044820294EF730F789F5872EE5A1F@IRVEXCHCCR01.corp.ad.broadcom.com>
References: <2B8D104E6375C044820294EF730F789F582C219247@IRVEXCHCCR01.corp.ad.broadcom.com>
	<1298435559.2431.2.camel@koala>
	<2B8D104E6375C044820294EF730F789F582C219251@IRVEXCHCCR01.corp.ad.broadcom.com>
	<1298697478.2467.1.camel@koala>
	<2B8D104E6375C044820294EF730F789F5872EE5A1D@IRVEXCHCCR01.corp.ad.broadcom.com>,
	<20110303230201.7376554f@wker>
In-Reply-To: <20110303230201.7376554f@wker>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used the following patch:

http://lists.infradead.org/pipermail/linux-mtd/2011-January/033768.html

Marco


________________________________________
From: Anatolij Gustschin [agust@denx.de]
Sent: Thursday, March 03, 2011 2:02 PM
To: Marco Cesarano
Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org
Subject: Re: UBI power cut

Hi Marco,

On Thu, 3 Mar 2011 11:40:49 -0800
"Marco Cesarano" <mcesaran@broadcom.com> wrote:
...
> I enabled full debug mode, and I realized that a similar problem
> happened in the thread "UBI recovery stops". Therefore I made the
> necessary changes and it works.

Which changes did you make?

Thanks,
Anatolij
