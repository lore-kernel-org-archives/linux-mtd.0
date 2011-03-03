Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PvERs-0001nx-Oy
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2011 19:44:33 +0000
From: "Marco Cesarano" <mcesaran@broadcom.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Thu, 3 Mar 2011 11:40:49 -0800
Subject: RE: UBI power cut
Message-ID: <2B8D104E6375C044820294EF730F789F5872EE5A1D@IRVEXCHCCR01.corp.ad.broadcom.com>
References: <2B8D104E6375C044820294EF730F789F582C219247@IRVEXCHCCR01.corp.ad.broadcom.com>
	,<1298435559.2431.2.camel@koala>
	<2B8D104E6375C044820294EF730F789F582C219251@IRVEXCHCCR01.corp.ad.broadcom.com>,
	<1298697478.2467.1.camel@koala>
In-Reply-To: <1298697478.2467.1.camel@koala>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I enabled full debug mode, and I realized that a similar problem happened i=
n the thread "UBI recovery stops". Therefore I made the necessary changes a=
nd it works.

Thanks for your help,
Marco
________________________________________
From: Artem Bityutskiy [dedekind1@gmail.com]
Sent: Friday, February 25, 2011 9:17 PM
To: Marco Cesarano
Cc: linux-mtd@lists.infradead.org
Subject: RE: UBI power cut

On Fri, 2011-02-25 at 13:03 -0800, Marco Cesarano wrote:
> Hi Artem,
>
> thanks for your answer. I enabled the debugging mode and I pasted the log=
s:

Sorry, but you unfortunately failed to provide full output - KERN_DEBUG
messages are omitted. The article I gave you discusses this in item 4.
E.g., try ignore_loglevel.

--
Best Regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
