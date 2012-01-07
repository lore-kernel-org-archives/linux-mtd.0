Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RjXyc-0000hf-4V
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2012 15:14:34 +0000
Received: by eekc13 with SMTP id c13so1729734eek.36
 for <linux-mtd@lists.infradead.org>; Sat, 07 Jan 2012 07:14:30 -0800 (PST)
Subject: Re: [PATCH (mtd-www) 1/7] nand-data: updates to S30ML-P devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Sat, 07 Jan 2012 17:14:27 +0200
In-Reply-To: <1325780040-19809-1-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1325949269.2153.0.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-01-05 at 16:13 +0000, Angus CLARK wrote:
> Updates to Spansion S30ML-P devices:
> 	- expand names to differentiate between x8 and x16 devices
> 	- fix ID 5th byte: 0x01 to 0x10 (checked with datasheet; seems regression
>           introduced as part of commit 165cfaa9cdb1054bbafa98f24f179c6aa101fbe6
>           "nand-data: remove asterisks")
> 
> Signed-off-by: Angus Clark <angus.clark@st.com>

Pushed patches 1-4 to mtd-www, thanks, let's wait for Brian to review
the rest.

Artem.
