Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7a5b-0000iA-Vf
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 11:26:14 -0500
Message-ID: <45AF9F38.9040602@nokia.com>
Date: Thu, 18 Jan 2007 18:24:24 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: Always print error messages
References: <5309548.532541169078227711.JavaMail.weblogic@ep_ml22>
In-Reply-To: <5309548.532541169078227711.JavaMail.weblogic@ep_ml22>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> Yes, simple solution is separate read oob from normal and scanning.
> I think is is easy because we can use state variable, FL_SCANNING instead of FL_READING in bbt.

Also there are the issues of a load error or ECC error when scanning for bad blocks:

Is it possible to get an ECC error when scanning a bad block?

If a load error occurs when scanning a bad block, does that mean the dataRAM
has been updated or not?
