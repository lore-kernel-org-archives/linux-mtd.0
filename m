Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAcHI-0000Ik-6a
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 13:12:47 +0000
Date: Tue, 16 May 2017 15:12:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH v2 38/53] mtdnand.rst: group the "::" with previous line
Message-ID: <20170516151208.0246f874@bbrezillon>
In-Reply-To: <f341afe2fca77fbb258007dc9addb36784b4f252.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <f341afe2fca77fbb258007dc9addb36784b4f252.1494935649.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2017 09:16:30 -0300
Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:

> Group the :: with the previous paragraph, in order to make it
> visually better when reading as a text file.
> 
> While here, replace:
> 	ored (with means "Covered or adorned with ore or metal")
> by:
> 	OR-ed
> 
> To reflect its true meaning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  Documentation/driver-api/mtdnand.rst | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
> index 8723175f955e..7c19795ebb4a 100644
> --- a/Documentation/driver-api/mtdnand.rst
> +++ b/Documentation/driver-api/mtdnand.rst
> @@ -843,10 +843,8 @@ Chip option constants
>  Constants for chip id table
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -These constants are defined in nand.h. They are ored together to
> -describe the chip functionality.
> -
> -::
> +These constants are defined in nand.h. They are OR-ed together to
> +describe the chip functionality::
>  
>      /* Buswitdh is 16 bit */
>      #define NAND_BUSWIDTH_16    0x00000002
> @@ -867,10 +865,8 @@ describe the chip functionality.
>  Constants for runtime options
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -These constants are defined in nand.h. They are ored together to
> -describe the functionality.
> -
> -::
> +These constants are defined in nand.h. They are OR-ed together to
> +describe the functionality::
>  
>      /* The hw ecc generator provides a syndrome instead a ecc value on read
>       * This can only work if we have the ecc bytes directly behind the
> @@ -881,9 +877,7 @@ describe the functionality.
>  ECC selection constants
>  -----------------------
>  
> -Use these constants to select the ECC algorithm.
> -
> -::
> +Use these constants to select the ECC algorithm::
>  
>      /* No ECC. Usage is not recommended ! */
>      #define NAND_ECC_NONE       0
> @@ -903,9 +897,7 @@ Hardware control related constants
>  ----------------------------------
>  
>  These constants describe the requested hardware access function when the
> -boardspecific hardware control function is called
> -
> -::
> +boardspecific hardware control function is called::
>  
>      /* Select the chip by setting nCE to low */
>      #define NAND_CTL_SETNCE     1
> @@ -929,9 +921,7 @@ Bad block table related constants
>  ---------------------------------
>  
>  These constants describe the options used for bad block table
> -descriptors.
> -
> -::
> +descriptors::
>  
>      /* Options for the bad block table descriptors */
>  
