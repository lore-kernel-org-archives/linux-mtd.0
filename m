Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aDJ3-0000mD-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 11:35:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020731163530.70c45960.stuart.menefy@st.com> 
References: <20020731163530.70c45960.stuart.menefy@st.com>  <1028064443.23642.52.camel@mahi190.austin.ibm.com> 
To: Stuart Menefy <stuart.menefy@st.com>
Cc: gromit1463@mailworks.org, linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Aug 2002 11:35:38 +0100
Message-ID: <29441.1028198138@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

stuart.menefy@st.com said:
> +// SIM: I've added this for the ST chip which reverts to read mode. Ahhh 
> +cfi_write(map, CMD(0x70), adr); 

I think that one's relatively harmless -- we can just stick that in 
unconditionally.

> +	/* The STMicroelectronics M28W320CB device reports incorrect CFI data.
> +	 * Check here and fix up if necessary.

Ug. I think we need to add a generic way to do this kind of thing -- look up
mfr and device ID in a table with certain fixups, and we can do the
AMD_BOOTLOC_BUG this way too.

--
dwmw2
