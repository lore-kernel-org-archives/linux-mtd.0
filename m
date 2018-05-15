Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIg5X-0006DT-M6
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 19:58:25 +0000
Subject: Re: [PATCH 4/5] libubigen: Maintain a eraseblock association table
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20180514112528.24092-1-richard@nod.at>
 <20180514112528.24092-5-richard@nod.at>
From: David Oberhollenzer <goliath@sigma-star.at>
Message-ID: <cc8f9abd-42b7-cc71-b89c-92c5cbd84aa3@sigma-star.at>
Date: Tue, 15 May 2018 21:58:01 +0200
MIME-Version: 1.0
In-Reply-To: <20180514112528.24092-5-richard@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/14/2018 01:25 PM, Richard Weinberger wrote:
> @@ -229,6 +234,12 @@ int ubigen_write_volume(const struct ubigen_info *=
ui,
>  		memset(outbuf + ui->data_offs + len, 0xFF,
>  		       ui->peb_size - ui->data_offs - len);
> =20
> +		vi->eba[lnum] =3D lseek(out, 0, SEEK_CUR) / ui->peb_size;
> +		if (vi->eba[lnum] =3D=3D -1) {
> +			sys_errmsg("cannot get offset of output file");
> +			goto out_free1;
> +		}
> +
>  		if (write(out, outbuf, ui->peb_size) !=3D ui->peb_size) {
>  			sys_errmsg("cannot write %d bytes to the output file", ui->peb_size=
);
>  			goto out_free1;

Wouldn't that division swallow errors? If I interpret the C99 draft corre=
ctly, dividing
an lseek return value of -1 by ui->peb_size > 1 should result in 0.

Thanks,

David
