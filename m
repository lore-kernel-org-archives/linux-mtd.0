Received: from nf-out-0910.google.com ([64.233.182.185])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HGnnv-0007hP-QC
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 21:54:06 -0500
Received: by nf-out-0910.google.com with SMTP id a4so95528nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Feb 2007 18:54:00 -0800 (PST)
Message-ID: <625fc13d0702121853q4cc72f3fm709f1bb6592d1810@mail.gmail.com>
Date: Mon, 12 Feb 2007 20:53:56 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Linux mtd" <linux-mtd@lists.infradead.org>,
	"Frank Haverkamp" <haver@vnet.ibm.com>
Subject: ubi branch in mtd-utils repo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I've added a ubi branch to the mtd-utils repo to give users a
"preview" of the ubi utilities.  This was created from Frank
Haverkamp's repo and the great work he and his team have done.  It
also contains a handful of fixes for 64 bit issues that I just fixed
today.

I intend for this branch to be the main repo for the utilities until
UBI is in the upstream kernel.  At that point, I'll merge the branch
to master and include them with the rest of the MTD utils.

If anyone has issues with this plan, please let me know.

thx,
josh
