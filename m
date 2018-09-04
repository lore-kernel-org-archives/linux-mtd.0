Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx5Z0-0006P6-Q3
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 07:15:52 +0000
Subject: Re: [PATCH mtd-utils] ubi-tests: io_paral: Fix error handling of
 update_volume()
To: Martin Lund <malu@gomspace.com>, linux-mtd@lists.infradead.org
References: <20180828083113.18198-1-malu@gomspace.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <d2063942-07f2-35f3-d9e3-2929155e8b56@sigma-star.at>
Date: Tue, 4 Sep 2018 09:15:27 +0200
MIME-Version: 1.0
In-Reply-To: <20180828083113.18198-1-malu@gomspace.com>
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

Hi,

generally, your approach seams reasonable. However there is one small iss=
ue with
your patch:

On 08/28/2018 10:31 AM, Martin Lund wrote:
> @@ -302,7 +302,14 @@ int main(int argc, char * const argv[])
>  	}
> =20
>  	for (i =3D 0; i < THREADS_NUM; i++)
> -		pthread_join(threads[i], NULL);
> +	{
> +		pthread_join(threads[i], (void **) &ret);
> +		if (ret !=3D 0)
> +			error =3D true;
> +	}
> +

"ret" happens to be an integer, you take a pointer to it and cast it to a=
 pointer
to a void*, which receives the result from the thread function.

There are platforms where sizeof(void*) !=3D sizeof(int)

Minor nit pick: the '{' should be on the same line as the for, similar to=
 the rest
of the code.

Thanks,

David
